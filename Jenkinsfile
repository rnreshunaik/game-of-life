pipeline{
        agent any
        options {
    timestamps()
  }
        stages{
                stage('SCM checkout'){
                        steps{
                        git changelog: false, poll: false, url: 'https://github.com/rnreshunaik/game-of-life.git'
                                }
                }
                 stage('Maven clean package') {
                         steps{
                                //sh '${mvnCMD} -Dmaven.test.failure.ignore=true install'
                                 tool name: 'maven 3.5.4', type: 'maven'
                                 sh 'mvn package'
                         }                 
           }  
        }
}
