# NextJS Template + SSR for Mia Platform
This is a template to be used in Mia Platform console to create a new monorepo Frontend application using [NextJS](https://nextjs.org) (React based) with SSR support.

The microservice comes with one page, the `index` one
```
http://localhost:3000
```
and it implements the technical endpoints for Kubernetes
```
/-/check
/-/healthz
/-/ready
```
## Local development
Make sure you have installed the following tools
* [NodeJs](https://nodejs.org/en/)

Open the terminal in the application folder and hit
```
npm run install
npm run dev
```

## Deploy
The microservice comes with Build&Deploy GitLab pipeline (see `.gitlab-ci.yml`), simply push the code and tag it when you want to deploy.

The build and deploy process complies the application and enables SSR (Server Side Rendering)