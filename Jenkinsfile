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
                
                stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    // Optionally use a Maven environment you've configured already
                    withMaven(maven:'maven 3.5.4') {
                        sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.3.0.1492:sonar'
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
                
        }
}
