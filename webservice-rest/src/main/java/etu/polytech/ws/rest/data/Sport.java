package etu.polytech.ws.rest.data;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by momo- on 06/10/2015.
 */
@Entity
public class Sport {

    @Id
    @GenericGenerator(name="sportgen" , strategy="increment")
    @GeneratedValue(generator="sportgen")
    @Column(name = "codesport")
    private int id;

    @Column(name = "libellesport")
    private String libelle;

    @Column(name = "unitetpssport")
    private String unite;

    @Column(name = "tarifunite")
    private int unitPrice;

    public Sport() {}

    public Sport(int id, String libelle, String unite, int unitPrice) {
        this.id = id;
        this.libelle = libelle;
        this.unite = unite;
        this.unitPrice = unitPrice;
    }

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public String getUnite() {
        return unite;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    @Override
    public String toString() {
        return "Sport{" +
                "id=" + id +
                ", libelle='" + libelle + '\'' +
                ", unite='" + unite + '\'' +
                ", unitPrice=" + unitPrice +
                '}';
    }
}
