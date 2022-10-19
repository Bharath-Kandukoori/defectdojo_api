pipeline {
    agent any
    tools { 
        maven 'Maven' 
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }
	
	    
	    stage ('Check-Git-Secrets') {
		    steps {
	        sh 'rm trufflehog || true'
		sh 'docker pull gesellix/trufflehog'
		sh 'docker run -t gesellix/trufflehog --json https://github.com/filestack/webapp.git > trufflehog'
		sh 'cat trufflehog'
	    }
	    }
	    
	    stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }   

	stage ('Upload Reports to Defect Dojo Api') {
		    steps {
			sh 'pip install requests'
			sh 'wget https://raw.githubusercontent.com/Bharath-Kandukoori/defectdojo_api/master/examples/dojo_ci_cd.py'
			sh 'chmod +x dojo_ci_cd.py'
			sh 'python3 dojo_ci_cd.py --product=1 --file "/tests/scans/trufflehog.xml" --scanner="Burp Scan" --high=0 --host=http://localhost:8000 --api_key=af2ab35a1b0cb933bbeb726c698596b58d23eb07 --user=admin'
		    }
	    }

    }

