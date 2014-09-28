package ca.ahmedaly.site.social.twitter;

import java.io.Serializable;

public class TweetForm implements Serializable {

	private String to;

	private String text;

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
