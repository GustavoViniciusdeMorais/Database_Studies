# ERD PlantUml
- [ERD Example](./erd.md)
### CLI
```bash
apt install default-jre -y

apt install default-jdk -y

apt-get install graphviz -y

wget of plantuml.jar

java -jar plantuml.jar class.txt
```
### Docker
[At docker hub](https://hub.docker.com/r/plantuml/plantuml-server )
```bash
docker pull plantuml/plantuml-server:tomcat

docker run -d -p 17135:8080 plantuml/plantuml-server:tomcat
```

```js
@startuml

class Person {

id: INTEGER

name: STRING

}

@enduml
```