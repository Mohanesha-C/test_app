package com.example.action;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorldAction extends ActionSupport {
    private String customMessage;

    @Override
    public String execute() {
        customMessage = "Hello from Apache Struts running inside Kubernetes! Updated by Sonata Team!!!";
        customMessage = customMessage + " Sonata Test Again SCM Automate!!";
        return SUCCESS;
    }

    public String getCustomMessage() {
        return customMessage;
    }

    public void setCustomMessage(String customMessage) {
        this.customMessage = customMessage;
    }
}
