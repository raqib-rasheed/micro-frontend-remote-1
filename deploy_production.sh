#!/bin/bash
  

#DEPLOY TO PRODUTION
ssh -t $DEPLOY_USER@$PROD_SERVER "docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY >> .env"
ssh -t $DEPLOY_USER@$PROD_SERVER "cd /home/$DEPLOY_USER/EMS_APP && echo HR_FE=$CI_COMMIT_SHORT_SHA >> .env" 
ssh -t $DEPLOY_USER@$PROD_SERVER "cd /home/$DEPLOY_USER/EMS_APP && docker compose pull hr-frontend"
ssh -t $DEPLOY_USER@$PROD_SERVER "cd /home/$DEPLOY_USER/EMS_APP && docker compose up -d --build hr-frontend"
