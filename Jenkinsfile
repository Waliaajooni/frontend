node{
  stage ('SCM Checkout') {
    git 'https://github.com/Waliaajooni/frontend'
  }
  
  stage ('Compile-Package') {
    //get maven home path
    
    def mvnHome = tool name: 'maven-3', type: 'maven'
    bash "${mvnHome}/bin/mvn package"
  }
}
