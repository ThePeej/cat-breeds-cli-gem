
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
		make_cats - Create object array of cats using scrape_index_page
		add_attributes_to_podcasts - Add data to each object using stitcher url via scrape_profile_page
		puts "Cats are neat! Check out all the different cat breeds!"
		list_all
		goodbye


	list_all
		puts all cats in alphabetical order in numbered list
		puts "Which breed would you like to learn more about?"
		puts "Enter the number or the name of the breed. Type exit to close."
		input = gets.strip



scraper.rb
	scrape_index_page(url)
		breed[:name] = doc.css("a.callout .callout-label").first.text.gsub(" Cat Breed\n", "")
		breed[:page_url] = doc.css("a.callout").first.attr("href")

	scrape_profile_page(url)

		breed[:size] =
		breed[:coat] =
		breed[:color] =
			size/coat/color
			key = doc.css("div.statsDef-content-list-item-label").first.text
			value = doc.css("div.statsDef-content-list-item-value").first.text.gsub("\n","").strip

		breed[:description] = doc.css("div.blurb-content-hd-titleMd p").text
		breed[:fun_fact] = doc.css("div.quarantine").first.text.gsub("\n","").strip


		breed[:similar] =
			Similar Cat Breeds
			(For Each)
			breed = doc.css("a.callout").first.css("img").first.attr("alt")
			url = BASE_PATH + "/#{breed}"


cat.rb

	attr_accessor :name, :page_url, :size, :coat, :color, :description, :fun_fact, :similar