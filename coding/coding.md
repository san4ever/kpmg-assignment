# Zone Printer demo application

This web application prints the Google Cloud datacenter it’s running on with
information about where the datacenter is located (city, country and flag).

It's used to demonstrate global load balancing capabilities of Google Cloud
HTTPS Load Balancer, as it routes the request to the compute region closest
to the visitor.

Example:

> ```text
> Welcome from Google Cloud datacenters at:
> The Dalles, Oregon, USA
>
> You are now connected to "us-west1"
> ```

