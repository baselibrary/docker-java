/***********************************************************************
 * Constants
 ***********************************************************************/
def image    = "baselibrary/java"
def registry = "thoughtworks.io"

/***********************************************************************
 * Build code
 ***********************************************************************/

node('docker') {
  stage 'Build'
    dockerImage = docker.build("${image}:6", "6")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
    }
    dockerImage = docker.build("${image}:7", "7")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
    }
    dockerImage = docker.build("${image}:8", "8")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
      dockerImage.push("latest")
    }
}


