jar_library(name='junit',
  jars=[
    jar('junit', 'junit', '4.12')
  ],
  # junit is frequently used only for its annotations.
  scope='forced',)


SCALAJS_REV = '0.6.25'

jar_library(name = 'scala-js-cli',
  jars = [
    scala_jar(org='org.scala-js', name='scalajs-cli', rev=SCALAJS_REV),
  ],
)

jar_library(name = 'scala-js-compiler',
  jars = [
    jar(org='org.scala-js', name='scalajs-compiler_2.12.8', rev=SCALAJS_REV),
  ],
)

jar_library(name = 'scala-js-library',
  jars = [
    scala_jar(org='org.scala-js', name='scalajs-library', rev=SCALAJS_REV),
  ],
)
