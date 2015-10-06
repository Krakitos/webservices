package etu.polytech.ws.rest.data;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by momo- on 06/10/2015.
 */
@Entity
public class TypeEmplacement {

    @Id
    @GenericGenerator(name="typeemplacementgen" , strategy="increment")
    @GeneratedValue(generator="typeemplacementgen")
    @Column(name = "codetypee")
    private int id;

    @Column(name = "libtypepl")
    private String libelle;

    @Column(name = "tariftypepl")
    private int price;

    public TypeEmplacement() {}

    public TypeEmplacement(String libelle, int price) {
        this.libelle = libelle;
        this.price = price;
    }

    @Override
    public String toString() {
        return "TypeEmplacement{" +
                "id=" + id +
                ", libelle='" + libelle + '\'' +
                ", price=" + price +
                '}';
    }
}
