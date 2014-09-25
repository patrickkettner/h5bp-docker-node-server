FROM node:0.10
MAINTAINER Patrick Kettner <patrickkettner@gmail.co>

ADD run.sh /run.sh
RUN chmod 755 /*.sh

ADD server-config /server-config
RUN npm install /server-config/

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www && ln -s /app /var/www
ADD sample-app/dist/ /app

# Add application code onbuild
ONBUILD RUN rm -fr /app
ONBUILD ADD . /app
ONBUILD RUN chown www-data:www-data /app -R

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
