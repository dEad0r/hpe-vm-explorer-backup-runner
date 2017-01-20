# HPE VM Explorer backup script

This little script helps avoiding opening the web GUI to start a backup task without having to use the in-built scheduler to run it.
It was tested with version 6.3. The script is designed for the Windows command line, but can easily be adapted to run on other systems, as it only makes use of cURL.

## Preparation and Execution

Create a copy of the login payload file:

```bash
copy payload\payload-login.json.example payload\payload-login.json
```

In this new file, replace HPE_USER and HPE_PASSWORD with your username and password for the GUI access.

The payload-task.json.example is provided for illustration purposes. To create a fitting file yourself, follow these steps:
* Open Google Chrome and start the development tool (Ctrl+Shift+i).
* Login into the GUI, right-click one of your VMs to create a backup, set up all necessary parameters (backup target etc.) and hit OK to start the task.
* In the inspector window, select the network tab and filter the request to find "PerformTask". Select the request and view the source of the request payload.
* Store the JSON object in a file named payload-task.json in the payload folder.

If you're *not* running this script on the same machine where HPE explorer is installed, adjust the variable *host* in runbackup.cmd
Execute runbackup.cmd whenever you want to backup your VM.
You may need to add the parameter --insecure if you haven't yet set up a properly signed SSL/TLS certificate on your server and urgently need to test this script. In runbackup.cmd, simply replace the line
```bash
curl -X POST https://%host%/PerformTask^
```
with
```bash
curl --insecure -X POST https://%host%/PerformTask^
```

## License

The license is included in the LICENSE file.