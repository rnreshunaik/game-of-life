pipeline{
        stages{
                stage ('SCM checkout'){
                        git changelog: false, poll: false, url: 'https://github.com/rnreshunaik/game-of-life.git'
                                }
        stage ('Maven clean package') {
             sh "mvn clean package"
           }  
        }
}
