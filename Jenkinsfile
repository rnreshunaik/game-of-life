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
                
                /*stage('Sonarqube analysis') {
                      steps {
                        script {
                                  scannerHome = tool 'sonar';
                                }
                                withSonarQubeEnv('sonar') {
                                bat "${scannerHome}/bin/sonar-scanner.bat" 
                                }

                              }
                                        }*/
                
                stage('build && SonarQube analysis') {
            steps {
                //withSonarQubeEnv('sonar') {
                    // Optionally use a Maven environment you've configured already
                    //withMaven(maven:'maven 3.5.4') {
                        sonarRunner = tool 'sonar'

                        sh '/var/lib/jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/sonar/bin/sonar-runner ' +
                            '-Dsonar.login=39182942bb48b6cecb60d66c6a90045d8590ae46 ' +
                            '-Dsonar.host.url=http://52.66.214.154:9000 ' +
                            '-Dsonar.projectName=$JOB_NAME ' +
                            '-Dsonar.projectVersion=0 ' +
                            '-Dsonar.projectKey=$JOB_NAME ' +
                            '-Dsonar.sources=/var/lib/jenkins/workspace/Pipeline_project'
                    }
                }
            
        
                
        }
}
