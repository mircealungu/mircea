- connect your GH account, select app, start build
- if it fails with `javascript Treating warnings as errors because process.env.CI = true.` then add in Deploys -> Deploy Settings -> Environment Variables CI = False (source: https://stackoverflow.com/a/67059560 )
- Now it deploys, but then routing does not work
- to fix that, you add the `/public/_redirects` with the following content: `/* /index.html 200` (from: https://blog.arnabghosh.me/netlify-react-router-not-working)
- this seems to work on netlify 
- however, we need to define .env.production for the ZEEGUU_API to be available in the app
	- but this does not work when I get a PR from the Antony 
	- trying to define the envvar as an ... envvar! in the Environment Variables settings 




Deploying a react app to Azure 
https://calm-stone-07adce410.3.azurestaticapps.net/
- also requires the definition of CI = False in the github action script
- the _redirect file does not help
- a XML seems to be needed cf. https://stackoverflow.com/a/63398586/1200070
- does not work :(






Other ways of deploying react for free: 
https://blog.logrocket.com/8-ways-deploy-react-app-free/



