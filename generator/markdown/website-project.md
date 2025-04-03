# Project Goals

The goal of this project is to have a website to hold all of my tech/cloud portfolio projects.
Its important that I utilized a Cloud Service Provider (CSPs) solution. 

# Technology Stack

- Draw.io (Diagramming)
- Github (Repo) and GitHub.dev (Static IDE)
- Gitpod.io (IDE)
- HTTP Server (Web Server) https://www.npmjs.com/package/http-server
- ChatGPT (Generating out HTML and CSS)



# Project Planning

## Utilize ChatGPT to rapidly build HTML and CSS 

## Hypothesis 

I think I can utilize ChatGPT or a similar service to quickly design our website. 

- you need to feed the design of the page one at a time, but it does produce results

#### prompts used

```txt
 I am building a portfolio website to showcase my techonology skills. I would like to create HTML markup and CSS for the designs provides. Please use flexbox and dont use absolutes or fixed values. I will provide you an image, and then I only wan the html back first. After I provided you all of my images, I will then ask for the css which will be applied to all pages. 
```
##### Results
The first attempt did not produce adequate results.
- the layout did not look correct

On further investigation I noticed this as well 
- the markup could have used more tags and less verbose
- the css looked adequate, but there must be clear mistakes with the CSS 




- Maybe we need to provide it more text and then the layout will work correctly
- Maybe we need to invest more time into our layout page
- Maybe we need to investigate the markup and css provide it bette instructions
- Maybe ChatGPT cannot adequately produce basic websites.


![Best Sample](docs/assets/2025-03-04%20Project.jpg)

## Further Research 

After seeing the results of my generated website I researched other succcess with using LMS to produce basic HTML paages.
The reccomendation was that results were inconsistent and that its better to just write HTML and CSS by hand.

- [ChatGPT Isn't Good at Coding Websites](https://medium.com/@alexagboolacodes/chatgpt-sucks-at-coding-websites-86420daa32fb)
- [5 Reasons you shouldn't use ChatGPT for...](https://good2bsocial.com/5-reasons-you-shouldnt-use-chatgpt-to-create-your-law-firms-website-content/) 


so it is possible but quality, effort and time will greatly vary. 

# Building Website HTML from scratch 

I am using Flex CSS and modern HTML5 tags as much as I can for the HTML and CSS.

- [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

For palce holder images I use this website to generate images out:

- [](https://placehold.co/) 

# Project Journal

> Logging time based on hourly increments 0.5 =30 mins, 0.25 = 15 mins with 15 mins being smallest increment

- 2025-03-04 (0.25h) Implemented Top-Level Architectual Design 
- 2025-03-04 (0.25h) Implemented Rough Design of Website 
- 2025-03-04 (0.25h) Improving Sceenshot Efficienft for rapid journaling with GreenShot
- 2025-03-04 (0.75h) Working with ChatGPT prompt to produce adequate results first attempt but subsequests attmep were in-efficient
- 2025-03-04 (0.5h) Research ChhatGPT4-0 feasibility and every source recommended not to use ChatGPT.
- 2025-03-04 (1h) WIP Partially Implemented homepage layout using flex css
- 2025-03-04 (1h) WIP Implement Video Popup
- 2025-03-08 (0.5h) Implement HTML Template for Portfolio Page 
- 2025-03-08 (1h) Implement Dynamic Templating with Ruby Erb
- 2025-03-08 (0.75h) Port Dynamic Templating over to python using Jinja 
- 2025-03-10 (0.75h) Port Dynamic Templating over to Nodejs using EJS
- 2025-03-10 (0.75h) AWS Architecture and Partial Price Calculation
- 2025-03-23 (2h) WIP, Implemented Static WEbsite Hosting CFN template, have yet to deploy, does not contain domain name yet. 
- 2025-03-25 (2h) Implemented and deploy Static Website Hosting. Marked up CFN template and codebuild yaml for build server. 
- 2025-03-31 (4h) Getting my Codebuild CFN code to execute, had to implement secrets and credentials, spend a ton of time debugging Github Pemissions and fixing code. 

## Cost Analysis


### AWS 


 #### S3 Standard Storage Charge  ($0 - $0.23 USD / month)

   - AWS offers different tiers of storage. since my website is intended for frequent access I will need to utilized s3 Standard tier. My website is unlikely to exceed 1GB of storage.
   - Larger file such as project files will be stored in GitHub. Videos will be uploaded to youtube, so I will be simply storing HTML, CSS and images. 
   - I'll ensure I optimize our images sizes AWS Charges $0.023 per GB for the first 50 GB. 
   - In 2024 AWS offers 5 GBs of storage for free in S3. I am able to utilize the free tier so my charge should be 0 or at worst case $0.23 USD 

#### S3 Data Retrieval Charges ($0 - $0.0054 USD / month)
- AWS charges for Data Retrieval eg. GET, POST, COPY
- When I upload my website and assets to an s3 Bucket that will utlize API calls such PUT
- When users request html, css and other assets, the API call GET will be used.
- I will be placing a caching layer infront of my website utilzing CloudFront CDN so not all calls will be made to my S3 Bucket
- I should expect Get requestss of less than 2000 requests per month (this is determined how people frequent the website and how many assets wthey will view)
- I should expect PUT requests less than 500 per quarter. (This is determined how often I update the website)
- AWS charges $0.005 per 1000 requests eg. PUT, COPY, POST, LIST requests
- AWS charges $0.004 per 1000 requests eg. GET, SELECT,and all other requests
- AWS has a free-tier for Data Retrieval 20,000 GET requests; 2,000 PUT, COPY, POST, or LIST Requests; and 100 GB of Data Transfer Out each month, 
- Since i'll be within the free tier I should expect a cost of 0 or a worst case $0.005 USD 

#### CloudFront Distribution Costs

- AWS CloudFront is a content delivery network (CDN) that caches content closer to users to reduce latency and S3 retrieval costs.
- The free tier includes 1 TB of data transfer out and 10 million HTTP/HTTPS requests per month.
- I expect my website traffic to stay within the free limits, so my cost should be $0.
- If traffic spikes, costs start at $0.085 per GB for the first 10 TB.

#### Route53 Hosted Zone Costs

- AWS Route53 provides domain name system (DNS) services to route users to my website.
- Hosting a domain costs $0.50 per hosted zone per month.
- I only need one hosted zone, so I should expect $0.50 per month.

#### CodeBuild Server Costs

- WS CodeBuild compiles source code, runs tests, and produces software packages.
- The free tier includes 100 build minutes per month with general-purpose Linux, small instance.
- My usage is minimal, so I expect to stay within the free tier and incur $0 costs.
- If I exceed the free tier, costs start at $0.005 per build minute.

#### AWS Lambda Costs

- AWS Lambda runs code in response to events and automatically manages the compute resources.
- The free tier includes 1 million requests and 400,000 GB-seconds of compute time per month.
- My website’s Lambda usage will be minimal (e.g., for contact form handling), so I expect to stay within the free tier.
- Beyond the free tier, costs are $0.20 per 1 million requests plus $0.00001667 per GB-second.

TODO 
- Secrets Manager to store PAT for GitHub
## Azure


### DNS Zone Outbond Data Transfers Charge $0.081

- $0.081 per GB First 10 TB /Month for Network Standard
- Azure has multiple tiers of delivery we'll utilize the standard which is the most effective
- We don't expect to exceed 1GB per month so we are likely looking at the minimum charge.

#### DNS Zone Pricing ($0.50 per zone/month)

- Azure charges a flat fee for hosting DNS zones.
- The standard pricing is $0.50 per zone per month.
- Since we’ll only need one DNS zone, we can expect a fixed monthly charge of $0.50.

#### Azure CDN Charges ($0.087 - $0.16 per GB)

- Azure CDN charges based on the region and data transfer volume.
- For North America and Europe, prices start at $0.087 per GB for the first 10 TB.
- With expected low traffic and caching, our costs should stay minimal, potentially under $1.

#### Storage Accounts Pricing (Starting at $0.018 per GB)

- Azure Storage offers various tiers; we’ll use the Standard tier for HTML, CSS, and assets.
- The cost starts at $0.018 per GB for hot storage.
- With a small website, we estimate storage needs of 1-2 GB, leading to costs of $0.02 - $0.04.

#### GitHub Actions (Included in Free Tier or Pay-as-You-Go)

- GitHub Actions can run CI/CD workflows with Azure integrations.
- Free tier includes 2,000 minutes per month for public repositories.
- For minimal usage, we expect to stay within the free tier, resulting in $0 cost.

#### Azure Serverless Functions ($0.20 per million executions)

- Azure Functions allow running serverless code in response to events.
- The first million executions are free, and it’s $0.20 per million after that.
- Given light usage, we expect either $0 or a minimal cost well under $1.

### GCP

#### Cloud Storage Charges ($0 - $0.02 USD / GB per month)

- GCP offers multiple storage classes. For frequently accessed data, we’ll use Standard Storage.
- Standard Storage costs $0.02 per GB, but GCP offers 5 GB of free storage.
- Since we expect to stay within the free tier, our storage cost should be $0 or, at most, $0.10 for 5 GB.
- Cloud DNS Charges ($0.40 USD / month per zone)

#### GCP charges $0.40 per month for each managed zone.

- DNS queries are charged at $0.40 per million queries.
- For low-traffic sites, costs should stay around $0.40 per month.

#### Cloud CDN Charges ($0 - $0.08 USD / GB)

- Using GCP’s CDN reduces latency and lowers data transfer costs.
- Pricing starts at $0.08 per GB, but the first 1 GB is free.
- For light usage, costs should be minimal, around $0 - $0.08 monthly.

#### Cloud Functions Charges ($0 - $0.40 USD / million invocations)

- GCP provides 2 million free invocations per month.
- Beyond the free tier, it costs $0.40 per million invocations.
- For limited backend logic, we’ll likely stay within the free tier.

#### Cloud Build Charges ($0 - $0.003 USD / build-minute)

- GCP offers 120 build minutes free each day.
- After that, it costs $0.003 per build-minute.
- For small projects, build costs should be $0 or under $1 monthly.

# Obstacles and Results

## CodeBuild and Github Personal Access Token

For GitHub PAT it might be the case that you cannot use Fine Grain permissions specifically  when using CodeBuild and a CodeStar Connection
Its reported online that Fine Grain PATs can be used with CodePipeline when using Codebuild

So we have to use Classic GitHub PAT even though it is more permessive. Edited* 

[Update] After getting our Codebuild server to completely work we went back to see if we could use fine grain permissions token and it worked without issue. Online people are misreporting the functionality. 

## Ruby Encoding 

When running our Ruby Code on Amazon Linux 2023 our code was complaining about encoding.
So we forced UTF-8 for my templates when being rendered for erb.

## CodeBuild Lambda Runtime Enviroment

As of Nov 2023 AWS Codebuild allows you to run your build server in the same runtime as a Lambda.
This option is not available in ca-central-1 

## Subdomain Delegation

There is technical uncvertainty around whether a domain's subdomains can be managed by different DNS servers. The term appears to be called subdomain delegation. My usecase is to have a main domaind, and  the a subdomain of aws. azure. gcp. and allow the hosted zone in the target CSP manage it. 

The Lambda Runtime uses a smaller footprint (memory and compute) as in theory will build faster due to faster start up time. 

If I wanted to use the Ruby generator, which I will likely want to use because it is best supported there in AWS, The Lambda Runtime is using Amazon Linux 2 instead of Amazon Linux 2023. AML does not come with AWS CLI pre-installed and I dont know if the Amazon Linux 2023 Lambda Runtime omits the AWS CLI (normally the AWS CLI is included). So I would have to do the SDK to upload files to s3. 

Due to the amount of technical uncertainty and the fact it will my code between platform less uniform I am going to use traditional method such as a docker container and continue on in ca-central-1

There is also ARM container available in us-east-1 but not in ca-central-1. In theory ARM should save pennies due to being more efficient, but for the frequency of our builds the savings is negligible.

## Subdomain Delegation

There is a technical uncertainty around wheter a domain's subdomains can be managed by different DNS servers. The term appears to be called subdomain delegation. My use case is to have a main domain, and the subdomain of aws. azure gcp. and allow hosted zone in the target CSP manage it.

## Draw.io 

I decided to implement our architectual diagrams in Draw.io due to its free use. It has all architecual icons for all major cloud service proviers. Software was difficult to utilized efficiently. For better results I would use Lucid Charts, It will greatly be more time efficient. 

## Rendering HTML Templating 

In this project I've implemented rendering markdown and embedding the output HTML into a HTML templating langauge.

I've implemented this solution in three languages: 

| Lang | Markdown | Templating | Task Manager | 
|---|---|---|---|
| Ruby | Redcarpet | ERB | Rake | 
| Python | Markdown | Jinja | Invoke | 
| Node.js | Marked | EJS | Npm |
 

### Ruby Generator 

```sh
cd generator/ruby
bundle install
bundle exec rake generate
```   

### Python Generator 

```sh
cd generator/python
pip install -r requirements.txt
invoke generate 
```