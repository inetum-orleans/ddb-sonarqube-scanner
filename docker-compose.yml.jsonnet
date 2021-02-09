local ddb = import 'ddb.docker.libjsonnet';

ddb.Compose(
    ddb.with(import '.docker/sonar-scanner/djp.libjsonnet',
    params={global: true}) +
    ddb.with(import '.docker/owasp-dependency-check/djp.libjsonnet',
    params={global: true, args: "--format \"ALL\" --enableExperimental"})
)
