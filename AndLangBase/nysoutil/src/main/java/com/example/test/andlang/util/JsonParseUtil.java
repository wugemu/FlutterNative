package com.example.test.andlang.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import org.json.JSONObject;

import java.lang.reflect.Type;
import java.util.Date;

public class JsonParseUtil {
    public static Gson gson3 = new GsonBuilder()
            .registerTypeAdapter(Date.class, new JsonDeserializer<Date>() {
                public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
                    return new Date(json.getAsJsonPrimitive().getAsLong()*1000);
                }
            })
            .registerTypeAdapter(int.class, new JsonDeserializer<Integer>() {
                @Override
                public Integer deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
                    if (BaseLangUtil.isEmpty(jsonElement.getAsString())) {
                        return 0;
                    }
                    return jsonElement.getAsInt();
                }
            })
            .registerTypeAdapter(double.class, new JsonDeserializer<Double>() {
                @Override
                public Double deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
                    if (BaseLangUtil.isEmpty(jsonElement.getAsString())) {
                        return 0d;
                    }
                    return jsonElement.getAsDouble();
                }
            })
            .registerTypeAdapter(long.class, new JsonDeserializer<Long>() {
                @Override
                public Long deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
                    if (BaseLangUtil.isEmpty(jsonElement.getAsString())) {
                        return 0l;
                    }
                    return jsonElement.getAsLong();
                }
            })
            .create();

    /**
     * 解析服务器返回的message字段信息
     *
     * @throws Exception
     */
    public static String getStringValue(String jsonStr, String key) {
        String value = null;
        try {
            JSONObject jsonObj = new JSONObject(jsonStr);
            value = jsonObj.getString(key);
            if("null".equals(value)){
                return "";
            }
        } catch (Exception e) {
            e.printStackTrace();
            value = null;
        }
        return value;
    }
    /**
     * 解析返回信息是否成功
     */
    public static boolean isSuccessResponse(String jsonStr)
            throws Exception {
        boolean isSuccess = false;
        JSONObject jsonObj = new JSONObject(jsonStr);
        int success = jsonObj.getInt("code");
        if (success==200) {
            isSuccess = true;
        }
        return isSuccess;
    }

    /**
     * 解析服务器返回的msg字段信息
     *
     * @throws Exception
     */
    public static String getMsgValue(String jsonStr) throws Exception {
        JSONObject jsonObj = new JSONObject(jsonStr);
        return jsonObj.getString("message");
    }
}
