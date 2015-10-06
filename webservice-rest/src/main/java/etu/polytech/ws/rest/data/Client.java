package etu.polytech.ws.rest.data;

import javax.persistence.*;

/**
 * Created by momo- on 06/10/2015.
 */
@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "numcli")
    private int id;

    @Column(name = "nomcli")
    private String name;

    @Column(name = "adrruecli")
    private String address;

    @Column(name = "cpcli")
    private int zipCode;

    @Column(name = "villecli")
    private String city;

    @Column(name = "piececli")
    private String piece;

    @Column(name = "numpiececli")
    private int numPiece;

    public Client() {
    }

    public Client(String name, String address, int zipCode, String city, String piece, int numPiece) {
        this.name = name;
        this.address = address;
        this.zipCode = zipCode;
        this.city = city;
        this.piece = piece;
        this.numPiece = numPiece;
    }

    public int getNumPiece() {
        return numPiece;
    }

    public String getPiece() {
        return piece;
    }

    public String getCity() {
        return city;
    }

    public int getZipCode() {
        return zipCode;
    }

    public String getAddress() {
        return address;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", zipCode=" + zipCode +
                ", city='" + city + '\'' +
                ", piece='" + piece + '\'' +
                ", numPiece=" + numPiece +
                '}';
    }
}
