node{
  stage ('SCM Checkout') {
    git 'https://github.com/Waliaajooni/frontend'
  }
  
  stage ('Compile-Package') {
    sh 'mvn package'
  }
}
