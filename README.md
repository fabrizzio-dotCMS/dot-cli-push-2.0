# dot-cli-push
Welcome to the dotCMS/GitHub repo sychronization Redme
Here I'll explain how we acomplish content synch integration between a GitHub Repository and a dotCMS instance through GHA.

In order to be able to reach a dotCMS instance basically we need to twings: 

#DOT_API_URL

This Param basically instructs this workflow about the target instance we want to interact with 


#DOT_TOKEN

This is safepass that must generated by yhe instace to grant access accordingly


#CREATE_EMPTY_WORKSPACE

This param isn't mandatory but it is useful to have when first interacting with the remote instace
