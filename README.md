# Thats Rerocar, I just build simple project for my portfolios

## How the clean architecture work for my project?
I just separating some folder like data, domain, and presentation.<br/><br/>
a) data <br/>
The data folder in here reflecting the data on the Database or external application. And this folder have 3 folders inside it: datasource (This is used for interact with the data in the database), models (This is used for data representation used to store and manage information in applications), and repositories (separation of business logic from how data is captured or stored). <br/>

So, for `data/repositories` why should `implementing` another repository on `domain/repositories`? <br/>
let's say you have a `CarRepository` interface that defines methods like `getCars()`, `CarRepositoryImp` will implement those methods with details of how the car data is retrieved, whether from an API, a local database, or an external service like Firebase. This is very useful when you want to change the data source in the future, because you only need to replace the implementation without changing the entire application. <br/><br/>

b) domain <br/>
The domain folder also contains rules and business logic that represent the internal structure of the project. And this folder have 2 folders inside it: usecase and repositories. The repositories used as `interface` that implement on `data/repositories` and the usecase as the logic / services. <br/><br/>

c) presentation
The presentation that contains BLoC, widget, and screen / page. <br/><br/>

## This is the stucture:
![Japahit-Page-4 drawio](https://github.com/user-attachments/assets/202f4d0d-9733-4cd4-9d45-8e7a01208e15)


## How to setup?
- Should installing the global of firebase. `pub global activate fireflutter`. You can using another method like using `npm i -g ....`.
- Check your firebase package using `fireflutter --version`
- Nice, you should write `firebase login`
- And write `flutterfire configure`. You can using your old project or make something new
- After the setup finished, you can check the configuration file on your project. You should put them to the `.env`
