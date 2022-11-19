package com.example.util;

import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public FileUpload() {
    }

    public BoardVO upload_photo(HttpServletRequest request) {
        String filename = "";
        int size_limit = 15*1024*1024;
        String realpath = request.getServletContext().getRealPath("upload");
        File dir = new File(realpath);
        if (!dir.exists()) dir.mkdirs();
        BoardVO one = null;
        MultipartRequest multipartRequest = null;

        try {
            DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
            multipartRequest = new MultipartRequest(request, realpath, size_limit, "utf-8", policy);
            filename = multipartRequest.getFilesystemName("photo");
            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq");

            if (seq!=null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setCategory(multipartRequest.getParameter("category"));

            if (seq!=null && !seq.equals("")) {
                BoardDAO dao = new BoardDAO();
                String old_filename = dao.getPhotoFilename(Integer.parseInt(seq));
                if (filename!=null && old_filename!=null) FileUpload.deleteFile(request, old_filename);
                else if (filename==null && old_filename!=null) filename = old_filename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath +"/"+filename);
        if (f.exists())f.delete();
    }

}
