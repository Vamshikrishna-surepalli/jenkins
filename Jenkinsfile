pipeline {
  agent any
  stages {
    stage('make') {
      steps {
        sh ''' 
        make
        '''
        }
    }
}

  post {
    always {
            /* clean up tmp directory */
      dir("${workspace}@tmp") {
          deleteDir()
      }
      /* clean up script directory */
      dir("${workspace}@script") {
          deleteDir()
      }
    }
  }
}