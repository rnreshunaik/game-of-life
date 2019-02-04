pipeline{
        agent any
        tools {
        maven 'maven 3.5.4'
        jdk 'jdk8'
               }
        stages{
                stage('SCM checkout'){
                        steps{
                        git changelog: false, poll: false, url: 'https://github.com/rnreshunaik/game-of-life.git'
                                }
                }
                stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
                 stage('Maven clean package') {
                         steps{
                                //sh '${mvnCMD} -Dmaven.test.failure.ignore=true install'
                                 //withMaven(tool name: 'maven 3.5.4', type: 'maven')
                                 //sh 'mvn package'
                                 sh 'mvn -Dmaven.test.failure.ignore=true install'
                         }                 
           }  
        }
}
