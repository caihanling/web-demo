package zx.soft.web.source;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.IOException;

/**
 * Created by jimbo on 9/17/15.
 */
public class GetInterface {

    public Object getData(String url) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpGet getMethod = new HttpGet(url);
        try{
            return client.execute(getMethod,new BasicResponseHandler());
        } finally {
            client.getConnectionManager().shutdown();
        }
    }
}
