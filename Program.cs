using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.StorageClient;

namespace StorageSample
{
    class Program
    {
        static void Main(string[] args)
        {
            try 
            {
                //Variables for the cloud storage objects.
                CloudStorageAccount cloudStorageAccount;
                CloudBlobClient blobClient;
                CloudBlobContainer blobContainer;
                BlobContainerPermissions containerPermissions;
                CloudBlob blob;

                // Use the local storage account.
                //cloudStorageAccount = CloudStorageAccount.DevelopmentStorageAccount;
                cloudStorageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=http;AccountName=gatekeeper;AccountKey=wlWvJ5qRyrRz80BbX7XFyUYz6Mh7oUTocddxlK9p3KwZWy4Hf4IlHl0QkYkD0OfcpaOXFhVz0FKfRE0PSHMO8w==");


                // If you want to use Windows Azure cloud storage account, use the following
                // code (after uncommenting) instead of the code above.
                // cloudStorageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=http;AccountName=your_storage_account_name;AccountKey=your_storage_account_key");

                // Create the blob client, which provides
                // authenticated access to the Blob service.
                blobClient = cloudStorageAccount.CreateCloudBlobClient();

                // Get the container reference.
                blobContainer = blobClient.GetContainerReference("mycontainer");
                // Create the container if it does not exist.
                blobContainer.CreateIfNotExist();

                // Set permissions on the container.
                containerPermissions = new BlobContainerPermissions();
                // This sample sets the container to have public blobs. Your application
                // needs may be different. See the documentation for BlobContainerPermissions
                // for more information about blob container permissions.
                containerPermissions.PublicAccess = BlobContainerPublicAccessType.Blob;
                blobContainer.SetPermissions(containerPermissions);

                // Get a reference to the blob.
                blob = blobContainer.GetBlobReference("odTransform.xsl");

                // Upload a file from the local system to the blob.
                Console.WriteLine("Starting file upload");
                blob.UploadFile(@"C:\Users\fmartin\Documents\Visual Studio 2010\Projects\HTMLprojects\RMCODataRSSReader\WebRole1\odTransform.xsl");  // File from local storage.
                Console.WriteLine("File upload complete to blob " + blob.Uri);
            }
            catch (StorageClientException e)
            {
                Console.WriteLine("Storage client error encountered: " + e.Message);

                // Exit the application with exit code 1.
                System.Environment.Exit(1);
            }
            catch (Exception e)
            {
                Console.WriteLine("Error encountered: " + e.Message);

                // Exit the application with exit code 1.
                System.Environment.Exit(1);
            }
            finally
            {
                // Exit the application.
                System.Environment.Exit(0);
            }
        }
    }
}
