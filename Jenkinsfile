node{
  stage ('SCM Checkout') {
    git 'https://github.com/Waliaajooni/frontend'
  }
  
  stage ('Compile-Package') {
    //get maven home path
    
    def mvnHome = tool name: '', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
}
