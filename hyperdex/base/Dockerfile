#
# Base image for HyperDex images
#
FROM spals/ubuntu

# Download and add public Hyperdex key
ADD http://ubuntu.hyperdex.org/hyperdex.gpg.key hyperdex.key
RUN apt-key add hyperdex.key
RUN rm hyperdex.key

# Add Hyperdex to apt sources
RUN echo 'deb [arch=amd64] http://ubuntu.hyperdex.org trusty main\n'\
>> /etc/apt/sources.list.d/hyperdex.list
RUN apt-get update

RUN apt-get install -y hyperdex hyperdex-common hyperdex-tools
