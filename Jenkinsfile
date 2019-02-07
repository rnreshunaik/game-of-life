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
                    withSonarQubeEnv('sonar'){


                            sh '/var/lib/jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/sonar/bin/sonar-runner ' +
                            //'-Dsonar.login=39182942bb48b6cecb60d66c6a90045d8590ae46 ' +
                            '-Dsonar.host.url=http://13.232.83.182:9000 ' +
                            '-Dsonar.projectName=$JOB_NAME ' +
                            '-Dsonar.projectVersion=0 ' +
                            '-Dsonar.projectKey=$JOB_NAME ' +
                            '-Dsonar.sources=/var/lib/jenkins/workspace/Pipeline_project' +
                            '-Dsonar.java.binaries=gameoflife-web/target/classes/'
                            sh 'mvn sonar:sonar'
                            }
                }
                }
                stage ('nexus upload') {
            steps {
                nexusPublisher nexusInstanceId: 'nexus-test', nexusRepositoryId: 'gol', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'gameoflife-web/target/gameoflife.war']], mavenCoordinate: [artifactId: 'gameoflife', groupId: 'com.wakaleo.gameoflife', packaging: 'war', version: 'Game-of-life-$BUILD_NUMBER']]]
            }
        }
        
            stage('deploy to tomcat') {
                    steps {
              //  withCredentials([usernameColonPassword(credentialsId: '89ec9ec6-5f5c-418c-8812-353ed6751431', variable: 'tomcat')]) {
                sh 'docker stop tomcat'
                sh 'docker build -t tomcat:release .'
                sh 'docker run -itd --rm -p 8090:8080 --name tomcat tomcat:release'
                
            }
        }
        
                
        }
}
