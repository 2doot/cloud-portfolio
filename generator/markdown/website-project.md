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

## Cost Analysis


### AWS 


 #### S3 Standard Storage Charge  ($0 - $0.23 USD / month)

   - AWS offers different tiers of storage. since my website is intended for frequent access I will need to utilized s3 Standard tier. My website is unlikely to exceed 1GB of storage.
   - Larger file such as project files will be stored in GitHub. Videos will be uploaded to youtube, so I will be simply storing HTML, CSS and images. 
   - I'll ensure I optimize our images sizes AWS Charges $0.023 per GB for the first 50 GB. 
   - In 2024 AWS offers 5 GBs of storage for free in S3. I am able to utilize the free tier so my charge should be 0 or at worst case $0.23 USD 

### S3 Data Retrieval Charges ($0 - $0.0054 USD / month)
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

TODO 
- Cloud Front Distribution Costs
- Route53 Hosted Zone Costs
- CodeBuild Server Costs
- AWS Lambda Costs

# Obstacles and Results

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