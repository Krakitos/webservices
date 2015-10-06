package etu.polytech.ws.rest.data;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by momo- on 06/10/2015.
 */
@Entity
public class Emplacement {

    @Id
    @GenericGenerator(name="emplacementgen" , strategy="increment")
    @GeneratedValue(generator="emplacementgen")
    @Column(name = "numempl")
    private int id;

    @OneToOne()
    @JoinColumn(name = "codetypee")
    private TypeEmplacement type;

    @Column(name = "surfaceempl")
    private short surface;

    @Column(name = "nbpersmaxempl")
    private short nbMaxPerson;

    public Emplacement() {}

    public Emplacement(TypeEmplacement type, short surface, short nbMaxPerson) {
        this.type = type;
        this.surface = surface;
        this.nbMaxPerson = nbMaxPerson;
    }

    public int getId() {
        return id;
    }

    public TypeEmplacement getType() {
        return type;
    }

    public short getSurface() {
        return surface;
    }

    public short getNbMaxPerson() {
        return nbMaxPerson;
    }

    @Override
    public String toString() {
        return "Emplacement{" +
                "id=" + id +
                ", type=" + type +
                ", surface=" + surface +
                ", nbMaxPerson=" + nbMaxPerson +
                '}';
    }
}
