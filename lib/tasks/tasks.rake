desc "Crawls hn/newest and informs members"
task :crawl => :environment do
  Crawler.crawl
end