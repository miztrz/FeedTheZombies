# Software Development Plan
## Feed The Zombies
*Brain food for the masses*

## 1. Project Purpose, Scope & Objectives

***Feed The Zombies (FTZ)*** is a content creation tool *(food for the masses)*. **FTZ** will pull news articles from the internet, and then generate text from the chosen article. The user would then use this text to form the basis of their blog article.

Student developer's are often tasked with creating portfolio's to showcase their skills, as its both a great tool for learning/assessment, and a good basis for gaining employment after the course has been completed. However, content creation is a big part of this that is time consuming, and not necessarily relevant to their technical skills. **FTZ** seeks to assist students with content creation by taking the hard work out of it.

The features that form the core project deliverable include api connections to a news rss feed scraper and an AI text generation tool. The application also allows the user to save the output of the AI text generation, offering a in terminal view as well as historical caching.

Each feature has its own limits on scope that have been chosen for design simplicity, for further information on the scope rules please see the project deliverables section below.

## 2. Features

### 2.1 News Api scraper

The News Api scraper feature is built using the "news-api" gem, which connects to the [newsapi.org](https://newsapi.org/) interface, allowing access to worldwide news resource rss feeds. This connection is the more complex of the 2 API's that have been used in **FTZ**, with 3 request types that could take different parameters, and 2 response types feeding back different information.

For this reason I chose to focus on 2 types of interactions, allowing the users to pull a default "top headings from Australia about Technology", and then to set their own search parameters for articles.

### 2.2 AI Text generator

The AI text generator is fed input from the user (in this case one off the news articles as per the above section), and then it returns a few pages of text based on the initial input.

### 2.3 File options, including users historical items

This will present the user with their historical items, and allow them to print them (in rainbow) to their screens, or to open them in nano.

## 3. User Interaction and Experience

To assist with prioritising the features available to me with the various API's I used a [user story mapping grid](https://airtable.com/shr9FaUCsv3ugvIWt), and the flow chart as per section 4 (below).

## 4. Control Flow Diagram

See [Feed The Zombies Workflows](FeedTheZombies_Workflows.pdf)

## 5. Implementation Plan

The project tracker for Feed The Zombies is located at: [Airtable - Live Implementation Plan](https://airtable.com/shrUMq3UUizoKuFcQ).

Airtable is a flexible tracking system, that also takes live "snapshots" along the way, which is what I used to build my project status reports as well.

## 6. Project Status Reports

[Nov 10, 2019 Status Update](https://airtable.com/shrK9M90YLxl0pQUL)

[Nov 16, 2019 Status Update](https://airtable.com/shrIqGKllAsMmhawI)
