# Angular 17.X

## General features

1. Two-way databind
2. Dependency injection
3. Component-based architecture
4. Excelent tooling support
5. Seamless integration with other libraries

## Project Structure

Dependencies installed
[node_modules](node_modules.md)

Dependencies definition

```bash
package.json
package-lock.json
```

Angular configuration

```bash
angular.json
```

Project source code

```bash
src
```

Components and modules

```bash
src/app
```

Assets (images, icon, text, etc)

```bash
src/assets
```

Application icon

```bash
src/favicon.ico
```

Application starting point, reference AppModule

```bash
src/main.ts
```

Global styles

```bash
src/styles.css
```

Project configuration

```bash
angular.json
tsconfig**.json
```

## Directives

> allows injecting service into components

```typescript
@Injectable({
    providedIn:'root'
})
```

## Forms

## Route guards

## HTTP Calls with Observables & RxJS

## Web Workers

## Lazy modules (Lazy loading)

## Automated testing

## CLI

> use to initalize, develop, scaffold and maintain directly from shell
> create a new angular project
> would you like to add Angular routing? Angular routing allows you to define paths in your application where each path can be associated with a component.
> which stylesheet format would you like to use? CSS, SCSS, Sass or Less
> do you want to enable Server-Side Rendering (SSR) and Static Site Generation
> (SSG/Prerendering)? Server-Side Rendering (SSR) and Static Site Generation (SSG) are two approaches used in web development to generate and deliver web pages to users. Static Site Generation (SSG) or Prerendering: HTML content of a web page is generated during the build process, before the application is deployed. Server-Side Rendering (SSR): server dynamically generates the HTML content of a web page and sends it to the client (usually a web browser) for rendering.

```bash
ng new myAngularProject
```

show cli version

```bash
ng --version
```

transpile typescript to javascript

```bash
ng build -w
```

> use g avoid "generate", use c avoid "component", use s avoid "service" and use m avoid "module"

create a new component

```bash
ng generate component CAMELCASE
```

create a new service

```bash
ng generate service CAMELCASE
```

create a new module, specifing file for routing in root directory of project

```bash
ng generate module app-routing --routing
```

## Tutorials

[Angular 4 Event Binding](https://coursetro.com/posts/code/59/Angular-4-Event-Binding)
