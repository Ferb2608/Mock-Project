package com.vn.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

import com.vn.util.GenerateID;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Vaccine_Type")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class VaccineType implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "VaccineType_ID")
    @GenericGenerator(name = "VaccineType_ID", strategy = "com.vn.util.GenerateID", parameters = {
            @org.hibernate.annotations.Parameter(name = GenerateID.INCREMENT_PARAM, value = "1"),
            @org.hibernate.annotations.Parameter(name = GenerateID.VALUE_PREFIX_PARAMATER, value = "VaccineType_"),
            @org.hibernate.annotations.Parameter(name = GenerateID.NUMBER_FORMAT_PARAMETER, value = "%05d")
    })
    @Column(name = "vaccine_type_id", nullable = false)
    private String id;

    @Column(name = "vaccine_type_name", length = 10, nullable = false)
    private String vaccineTypeName;

    @Column(length = 200)
    private String description;

    @Transient
    private MultipartFile imageFile;

    @Column
    private String imageUrl;

    @Column
    private Boolean vaccineTypeStatus = true;

    @OneToMany(mappedBy = "vaccineType", cascade = CascadeType.ALL)
    private Set<Vaccine> vaccines;
}
