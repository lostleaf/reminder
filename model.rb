require 'ostruct'
require 'time'

class News
	def self.get_all
		news = []

		Dir.glob "news/*.md" do |file|
			meta, content   = File.read(file).split("\n\n", 2)
			article         = OpenStruct.new YAML.load(meta)
			article.time    = Time.parse article.time.to_s
			article.content = content
			article.slug    = File.basename file, '.md'

			news << article
		end

		news.sort_by { |article| article.time }.reverse
	end
end
