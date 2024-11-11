[webservers]
%{ for i in web }
${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}  fqdn=${i["fqdn"]} 

%{~ endfor ~}

[databases]
%{ for i in database }
${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}  fqdn=${i["fqdn"]} 

%{~ endfor ~}

[storage]
%{ for i in storage }
${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}  fqdn=${i["fqdn"]} 
%{~ endfor ~}