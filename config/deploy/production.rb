# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '35.166.99.111', user: 'fumiaki', roles: %w{app db web}

#デプロイするサーバにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/makuake_key_rsa'
