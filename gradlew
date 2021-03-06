package com.zl.opengl.utils;

import android.util.Log;

import static android.opengl.GLES20.*;

public class ShaderHelper {

    private static final String TAG = "ShaderHelper";
    private static final boolean DEBUG = true;


    private static int compileShader(int type, String shaderCode) {
        // 创建着色器
        int shaderObjectId = glCreateShader(type);
        if (shaderObjectId == 0) {
            if (DEBUG) Log.w(TAG, "创建着色器失败");
            return 0;
        }
        //1.2绑定代码到着色器上(加载着色器代码)
        glShaderSource(shaderObjectId, shaderCode);
        //1.3编译着色器代码
        glCompileShader(shaderObjectId);
        //1.4主动获取编译状态
        int[] compileStatus = new int[1];
        glGetShaderiv(shaderObjectId, GL_COMPILE_STATUS, compileStatus, 0);
        if (DEBUG) Log.v(TAG, "编译着色器代码：" + "\n");
        if (DEBUG) Log.i(TAG, shaderCode);

        //判断编译状态

        if (compileStatus[0] == GL_FALSE) {
            if (DEBUG) Log.w(TAG, "着色器编译失败：" + "\n");
            if (DEBUG) Log.e(TAG, glGetShaderInfoLog(shaderObjectId));
            glDeleteShader(shaderObjectId);
            return 0;
        }
        return shaderObjectId;
    }


    /**
     * 加载并编译顶点着色器
     *
     * @param shaderCode 顶点着色器代码
     * @return 顶点着色器id（返回0表示失败）
     */
    public static int compileVetexShader(String shaderCode) {
        return compileShader(GL_VERTEX_SHADER, shaderCode);
    }

    /**
     * 加载并编译片元着色器
     *
     * @param shaderCode 片元着色器代码
     * @return 片元着色器id（返回0表示失败）
     */
    public static int compileFragmentShader(String shaderCode) {
        return compileShader(GL_FRAGMENT_SHADER, shaderCode);
    }

    /**
     * 将顶点着色器和片元着色器一起连接到OpenGL程序中
     *
     * @param vetexShaderId    顶点着色器Id
     * @param fragmentShaderId 片元着色器Id
     * @return
     */
    public static int linkProgram(int vetexShaderId, int fragmentShaderId) {
        //3.1创建一个新的OpenGL程序

        final int programObjectId = glCreateProgram();
        if (programObjectId == 0) {
            if (DEBUG) Log.e(TAG, "创建程序失败");
            return 0;
        }
        //顶点着色器
        glAttachShader(programObjectId, vetexShaderId);
        //片元着色器
        glAttachShader(programObjectId, fragmentShaderId);

        //将两个着色器一起链接到OpenGL程序
        glLinkProgram(programObjectId);
        //获取链接状态
       final int[] linkStatus = new int[1];
        glGetShaderiv(programObjectId, GL_LINK_STATUS, linkStatus, 0);
        if (linkStatus[0] == GL_FALSE) {
            if (DEBUG) Log.w(TAG, "链接程序失败：" + "\n");
            if (DEBUG) Log.e(TAG, glGetProgramInfoLog(programObjectId));
            //如果失败，删除程序对象
            glDeleteProgram(programObjectId);
            return 0;
        }
        return programObjectId;

    }


    public static boolean validateProgram(int programObjectId) {
        glValidateProgram(programObjectId);
        int[] validateStatus = new int[1];
        glGetProgramiv(programObjectId, GL_VALIDATE_STATUS, validateStatus, 0);
        if (DEBUG)
            Log.d(TAG, "验证程序状态：" + validateStatus[0] + "\n程序日志信息" + glGetProgramInfoLog(programObjectId));
        return validateStatus[0] != 0;
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      