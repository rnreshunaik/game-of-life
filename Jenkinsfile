pipeline{
        agent any
        options {
    timestamps()
  }
        stages{
                stage('SCM checkout'){
                        git changelog: false, poll: false, url: 'https://github.com/rnreshunaik/game-of-life.git'
                                }
                 stage('Maven clean package') {
                         steps{
             sh 'mvn clean package'
                         }                 
           }  
        }
}
