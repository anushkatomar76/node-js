# Get the Node Base Image
FROM node:12.2.0-alpine


#SET the working directory
WORKDIR /data

#Copy the code from src to dest
COPY . .

#Istall the dependicies
RUN npm install
RUN npm run test
EXPOSE 8000

#Run the code
CMD ["node","app.js"]
