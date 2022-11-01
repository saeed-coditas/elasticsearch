# Elasticsearch Assignment

Q.1 What did you choose to automate the provisioning and bootstrapping of the instance? Why?

    I.  For Automation: Used Terraform for provisioning the AWS resources.
    II. For BootStraping: Used a Shell Scripting for installing & configuring the elasticsearch.

Q.2 How did you choose to secure ElasticSearch? Why?

    We can secure elasticseach using SSL Certificate/TLS  Connections and also we can configured using User/Roles.

Q.3 How would you monitor this instance? What metrics would you monitor?

    We can Monitor the Instances using AWS Cloudwatch Service. Also we can configure Prometheus, Grafana for visualization. We can monitor metrics like CPU Utilization, Memory Utilization and Disk Utilization of the instance.

Q.4 Could you extend your solution to launch a secure cluster of ElasticSearch nodes? What would need to change to support this use case?

    We can secure our ElasticSearch nodes Using SSL/TLS Communication. Also we can configure Basic Authentication.

Q.5 Could you extend your solution to replace a running ElasticSearch instance with little or no downtime? How?

    We can Use AWS ElasticSearch Manage Service and also we can integrates nodes with Active Directory.

Q.6 Was it a priority to make your code well structured, extensible, and reusable?

    It is priority to make our code well structured. So later we can modify our code easily with very less efforts.

Q.7 What sacrifices did you make due to time?

    SSL Automation connection is pending for DNS. But it's working with default SSL with IP.

### Screenshots

##### Login with Basic Auth UserName & Password:

![image](https://user-images.githubusercontent.com/76781622/199305183-e7722dcb-2b5e-4a39-a808-aee2eb02d310.png)

##### Screen after login:

![image](https://user-images.githubusercontent.com/76781622/199305779-cf1fd728-452b-4096-ab96-5e50ebbcd0b1.png)
