# Elasticsearch Assignment

Q.1 What did you choose to automate the provisioning and bootstrapping of the instance? Why?
    I.  Automation: I used Terraform for provisioning the AWS resource.
    II. BootStraping: I used a Shell Scripting for configuring &  installing the elasticsearch.

Q.2 How did you choose to secure ElasticSearch? Why?
    We can secure elasticseach using SSL Certificate/TLS  Connections and also we can configured using User/Roles.

Q.3 How would you monitor this instance? What metrics would you monitor?
    We can Monitor the Instances using AWS Cloudwatch Service. Also we can configure Prometheus, Grafana for visualization. We can monitor metrics like CPU Utilization, Memory Utilization and Disk Utilization.

Q.4 Could you extend your solution to launch a secure cluster of ElasticSearch nodes? What would need to change to support this use case?
    We can secure our ElasticSearch nodes Using SSL/TLS Communication. Also we can configure Basic Authentication.

Q.5 Could you extend your solution to replace a running ElasticSearch instance with little or no downtime? How?
    We can Use AWS ElasticSearch Manage Service and also we can integrates nodes with Active Directory.

Q.6 Was it a priority to make your code well structured, extensible, and reusable?
    It is priority to make our code well structured. So later we can modify our code easily with very less efforts.

Q.7 What sacrifices did you make due to time?
    SSL Automation connection is pending for DNS. But it's working with default SSL with IP.