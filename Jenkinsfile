pipeline{
        stages{
                stage ('SCM checkout'){
                        git https://github.com/rnreshunaik/game-of-life.git
                                }
        stage ('Maven clean package') {
             sh "mvn clean package"
           }  
        }
}
