package com.onestop.codeitsoft.eventBackend.services;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onestop.codeitsoft.eventBackend.entity.Response;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class AwsFileUploader {

    @Value("${aws.access.key}")
    private String accessKeyId;

    @Value("${aws.secret.key}")
    private String secretAccessKey;

    @Value("${aws.s3.bucket}")
    private String bucketName;

    public ResponseEntity<Response> uploadFile(
            MultipartFile mpfile,
            String keyName) throws IOException {

        Response resp = new Response();

        S3Client s3Client = S3Client.builder()
                .region(Region.AP_SOUTH_1)
                .credentialsProvider(
                        StaticCredentialsProvider.create(
                                AwsBasicCredentials.create(accessKeyId, secretAccessKey)))
                .build();

        try (InputStream inputStream = mpfile.getInputStream()) {

            PutObjectRequest request = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(keyName)
                    .build();

            s3Client.putObject(request,
                    RequestBody.fromInputStream(inputStream, mpfile.getSize()));

            resp.setCode(1);
            resp.setMessage("File Uploaded Successfully");

        } catch (Exception e) {
            resp.setCode(0);
            resp.setMessage(e.getMessage());
        }

        return new ResponseEntity<>(resp, HttpStatus.OK);
    }
}
