
Project Outline

Provide a CLI
CLI must provide access to data from a web page.
The data provided must go at least one level deep, generally by showing the user a list of available data and then being able to drill down into a specific item.
The CLI application can not be a Music CLI application as that is too similiar to the other OO Ruby final project. Also please refrain from using Kickstarter as that was used for the scraping 'code along'. Look at the example domains below for inspiration.
Use good OO design patterns. You should be creating a collection of objects - not hashes.
For bonus points, instead of just creating an application, create a gem and for extra bonus points try publishing it to RubyGems.


Instructions -
Watch this video walkthrough of building a CLI Gem called Daily Deal before you begin.
Create a new repository on GitHub for your application, ie: name-cli-app.
When you create the CLI app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. This is important and you'll be graded on this.
Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.
Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement before you submit your project.
Prepare a video demo (narration helps!) describing how a user would interact with your working gem.
Write a blog post about the project and process.
On Learn, submit links to the GitHub repository for your app, your video demo, and your blog post each to the corresponding textbox in the right rail, and hit "I'm done" to wrap it up.


-----


Project Planning:

----- File Responsibilities -----

cli.rb
	call
		make_podcasts - Create object array of podcasts using scrape_index_page
		add_attributes_to_podcasts - Add data to each object using stitcher url via scrape_profile_page
		-Puts "Welcome to the 100 most popular podcasts of the week!"
		menu
		goodbye


	menu
		puts "List all"
		puts "Filter by Category"

	List All
		puts "List:"
		puts "[1] All At Once"
		puts "[2] 1-25"
		puts "[3] 26-50"
		puts "[4] 51-75"
		puts "[5] 76-100"

	By Category
		puts "List:"
		puts "[1] Comedy"
		puts "[2] Education"
		puts "[3] News"
		puts "[4] Society and Culture"








scraper.rb
	scrape_index_page(url)
		podcast[:name] =
		podcast[:rank] =
		podcast[:genre] =
		podcast[:page_url] =

	scrape_profile_page(url)
		podcast[:about] =
		podcast[:rating] = 
		pdocast[:review_count] =
		podcast[:twitter_url] = (If nil, "this podcast does not have a twitter/fb")
		podcast[:facebook_url] = (If nil, "this podcast does not have a twitter/fb")







podcast.rb
