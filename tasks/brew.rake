namespace :brew do

  desc 'Install Homebrew'
  task :install do
    if find_executable 'brew'
      sh 'brew update'
    else
      sh '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
  end

  desc 'Install development dependencies'
  task :install_dev_dependencies do
    sh 'brew install rbenv ruby-build \
        z mongo mysql redis postgresql \
        imagemagick v8 chromedriver'
  end

  desc 'Restart Homebrew services'
  task :restart_services do
    sh 'brew services restart mongodb'
    sh 'brew services restart mysql'
    sh 'brew services restart redis'
    sh 'brew services restart postgresql'
  end
end