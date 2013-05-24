class Component < Thor
  include Thor::Actions

  COMPONENTS = {
    "necolas/normalize.css" => "v1"
  }

  desc "create", "Create basic structure to use Component components."
  def create
    create_file "component.json" do

    name         = ask "App name:", :cyan
    default_name = "indefinido/#{name.split(' ')[0].downcase}"

    repo = ask "Repository (<username>/<project>): [#{default_name}]", :cyan
    repo = default_name if repo == ""

    desc = ask "App description:", :cyan

    repos = []
    if yes? "Choose some components? [y/n]", :cyan

      COMPONENTS.each_pair do |repo, version|
        repos << [repo,version] if yes? "  #{repo}(#{version})? [y/n] ", :magenta
      end
    end

<<-COMPONENT
{
  "name": "#{name}",
  "repo": "#{repo}",
  "description": "#{desc}",
  "version": "0.0.1",
  "keywords": [],
  "dependencies": {
    #{ repos.map do |repo| "\"#{repo[0]}\": \"#{repo[1]}\"" end.join ",\n    " }
  },
  "development": {},
  "paths": ["lib/components", "vendor/components"],
  "license": "MIT"
}
COMPONENT
    end

    empty_directory "vendor/components"
    empty_directory "vendor/assets/components"
  end


  desc "install [PATH]", "Install components to PATH, defaulted to ./vendor/components"
  def install path="vendor/components"
    run "component install --out #{path}"
  end


  desc "build [PATH]", "Build components to PATH, defaulted to ./vendor/assets/components"
  def build path="vendor/assets/components"
    run "component build --out #{path}"
  end


end