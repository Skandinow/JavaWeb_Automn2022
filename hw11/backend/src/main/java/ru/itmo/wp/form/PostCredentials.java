package ru.itmo.wp.form;

import javax.persistence.Lob;
import javax.validation.constraints.*;

public class PostCredentials {
    @NotBlank
    @NotNull
    @Size(min=1, max=255)
    @Pattern(regexp = "[a-zA-Z]{2,64}", message = "Expected Latin letters")
    private String title;

    @NotEmpty
    @Size(min = 2, max = 64000)
    @Pattern(regexp = "[a-zA-Z]", message = "Expected Latin letters")
    @Lob
    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}


